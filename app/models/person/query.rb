class Person::Query
  include ActiveModel::Model
  include ActiveModel::Attributes
  include States

  attribute :addressee_contains, :string
  attribute :lastname_starts_with, :string
  attribute :city_contains, :string
  attribute :state_is, :string
  attribute :zip_is, :string

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
      addressee_contains.present? ?
        scope.where("addressee LIKE ?", sanitize(addressee_contains) ) :
        scope
    end

    def filter_by_lastname(scope)
      lastname_starts_with.present? ?
        scope.where("lastname LIKE ?", sanitize(lastname_starts_with) + "%" ) : scope
    end

    def filter_by_city(scope)
      city_contains.present? ?
        scope.where("city LIKE ?", sanitize(city_contains) ) :
        scope
    end

    def filter_by_state(scope)
      state_is.present? ?
        scope.where("state = ?", sanitize(state_is) ) :
        scope
    end

    def filter_by_zip(scope)
      zip_is.present? ?
        scope.where("zip = ?", sanitize(zip_is) ) :
        scope
    end

    private
      def sanitize(parm)
        Person.sanitize_sql_like(parm)
      end
end