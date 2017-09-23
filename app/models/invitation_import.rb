class InvitationImport
  require 'csv'

  def initialize(file)
    @file = file
  end

  def save!
    Invitation.transaction do
      invitations.each(&:save!)
    end
  end

  private

  attr_reader :file

  def invitations
    result = []
    CSV.foreach(file.path, headers: true) do |vals|
      result << Invitation.new(
        addressee: vals[0],
        address_line_1: vals[1],
        address_line_2: vals[2],
        city: vals[3],
        state: vals[4],
        country: vals[5],
        zip: vals[6]
      )
    end
    result
  end
end
