class TextAdminJob < ApplicationJob
  queue_as :default

  def perform(location)
    TextMessenger.new(
      recipient: Rails.application.secrets.admin_phone,
      message: "The location '#{location.name}' was just added. Go vet it!"
    ).send
  end
end