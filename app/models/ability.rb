class Ability
  include Hydra::Ability

  include Hyrax::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    # Probbly too permissive in the long run. Replace and augment with
    # hydra-role-management gem in long run.
    can [:create], Asset
    can [:create], EssenceTrack
    can [:create], PhysicalInstantiation
    can [:create], DigitalInstantiation
    can [:create], Collection
    can [:create], Contribution

    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

    if current_user.admin?
      can [:create, :show, :add_user, :remove_user, :index, :edit, :update, :destroy], Role
      can [:create, :savenew, :new, :index, :edit, :update, :destroy], User
    end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
  end
end
