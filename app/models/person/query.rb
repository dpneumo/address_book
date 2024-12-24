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
      if addressee_contains.present?
        scope.where("addressee LIKE ?", ("%" + sanitize(addressee_contains) + "%" ) )
      else
        scope
      end
    end

    def filter_by_lastname(scope)
      if lastname_starts_with.present?
        scope.where("lastname LIKE ?", (sanitize(lastname_starts_with) + "%") )
      else
        scope
      end
    end

    def filter_by_city(scope)
      if city_contains.present?
        scope.where("city LIKE ?", ("%" + sanitize(city_contains) + "%") )
      else
        scope
      end
    end

    def filter_by_state(scope)
      if state_is.present?
        scope.where("state = ?", sanitize(state_is) )
      else
        scope
      end
    end

    def filter_by_zip(scope)
      if zip_is.present?
        scope.where("zip = ?", sanitize(zip_is) )
      else
        scope
      end
    end

    private
      def sanitize(parm)
        Person.sanitize_sql_like(parm)
      end
end

