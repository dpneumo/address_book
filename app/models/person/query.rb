class Person::Query
  include ActiveModel::Model
  include ActiveModel::Attributes
  include States

  attribute :addressee_contains, :string
  attribute :lastname_contains, :string
  attribute :city_contains, :string
  attribute :state_equals, :string
  attribute :zip_equals, :string

  def results
    valid? ? filter_people(scope = Person.all) : []
  end

  private
    def filter_people(scope)
      filter_by_addressee(scope)
        .then { filter_by_lastname(_1) }
        .then { filter_by_city(_1)     }
        .then { filter_by_state(_1)    }
        .then { filter_by_zip(_1)      }
    end

    def filter_by_addressee(scope)
      addressee_contains.presence ? scope.where("addressee LIKE ?", "%#{addressee_contains}%") : scope
    end

    def filter_by_lastname(scope)
      lastname_contains.presence ? scope.where("lastname LIKE ?", "%#{lastname_contains}%") : scope
    end

    def filter_by_city(scope)
      city_contains.presence ? scope.where("city LIKE ?", "%#{city_contains}%") : scope
    end

    def filter_by_state(scope)
      state_equals.presence ? scope.where("state = ?", state_equals) : scope
    end

    def filter_by_zip(scope)
      zip_equals.presence ? scope.where("zip = ?", zip_equals) : scope
    end
end