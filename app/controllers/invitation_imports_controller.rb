class InvitationImportsController < ApplicationController
  def create
    InvitationImport.new(file_param).save!
    redirect_to invitations_path
  end

  private

  def file_param
    params.require(:invitation_import).require(:file)
  end
end
