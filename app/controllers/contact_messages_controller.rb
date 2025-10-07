class ContactMessagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @contact_message = ContactMessage.new
  end

  def create
  end
end
