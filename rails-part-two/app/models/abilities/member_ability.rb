class Abilities::MemberAbility
  include CanCan::Ability

  def initialize(member)

    member ||= Member.new

    # member = member || Member.new

    # if member is not null:
    #   member = Member.new

    can [
      :create,
      :destroy,
      :location,
      :activity,
    ], Member, id: member.id

    can [
      :index,
      :destroy,
    ], Member
  end
end
