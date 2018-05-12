class UniversalResourceIdentifierController < ApplicationController

  def create
    @url = UniversalResourceIdentifier.find_or_create_by(long_url: params[:universal_resource_identifier][:long_url].try(:downcase))
  end

  def visit
    if url = UniversalResourceIdentifier.find_by(short_url_id: params[:short_url_id])
      user_agent = UserAgent.parse(request.user_agent)
      RecordHitJob.perform_later(url, {ip_address: request.remote_ip,
                                       bot_hit: request.bot?,
                                       http_referer: request.referer,
                                       browser: user_agent.browser,
                                       version: user_agent.version.to_s,
                                       platform: user_agent.platform,
                                       request_dump: request.inspect})
      redirect_to(url.long_url)
    else
      head :not_found
    end
  end

  def show
    if @uri = UniversalResourceIdentifier.find_by(short_url_id: params[:id])
    else
      head :not_found
    end
  end

end
