STATEABBREV=%w( AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NC NE NV NH NJ NM NY ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY )

class Person::Query
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :city_equals, :string
  attribute :state_equals, :string
  attribute :zip_equals, :string
  attribute :addressee_contains, :string
  attribute :lastname_contains, :string

  def results
    valid? ? sort_people.then { filter_people(_1) } : []
  end

  def options_for_state_select
    STATEABBREV.map {|st| [st, st] }
  end

  private
    def sort_people(scope = Person.all)
      scope.order("#{lastname} #{addressee}")
    end

    def filter_people(scope)
      filter_by_addressee(scope)
        .then {filter_by_lastname(_1) }
        .then {filter_by_city(_1) }
        .then {filter_by_state(_1) }
        .then {filter_by_zip(_1) }
    end

    def filter_by_addressee(scope)
      addressee_contains.presence ? scope.where("addressee LIKE ?", "%#{addressee_contains}%") : scope
    end

    def filter_by_lastname(scope)
      lastname_contains.presence ? scope.where("lastname LIKE ?", "%#{lastname_contains}%") : scope
    end

    def filter_by_city(scope)
      city_equals.presence ? scope.where("city = ?", city_equals) : scope
    end

    def filter_by_state(scope)
      state_equals.presence ? scope.where("state = ?", state_equals) : scope
    end

    def filter_by_zip(scope)
      zip_equals.presence ? scope.where("zip = ?", zip_equals) : scope
    end
end