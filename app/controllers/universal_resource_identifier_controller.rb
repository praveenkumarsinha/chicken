class UniversalResourceIdentifierController < ApplicationController

  def create
    @url = UniversalResourceIdentifier.find_or_create_by(long_url: params[:universal_resource_identifier][:long_url].try(:downcase))
  end

  def visit
    if url = UniversalResourceIdentifier.find_by(short_url_id: params[:short_url_id])
      RecordHitJob.perform_later(url, {ip_address: request.remote_ip,
                                       bot_hit: request.bot?,
                                       http_referer: request.referer,
                                       request_dump: request.inspect})
      redirect_to(url.long_url)
    else
      head :not_found
    end
  end

end
