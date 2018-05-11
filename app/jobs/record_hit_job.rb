class RecordHitJob < ApplicationJob
  queue_as :default

  def perform(universal_resource_identifier, options)
    universal_resource_identifier.hit!(options)
  end
end
