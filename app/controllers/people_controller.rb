class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people
  def index
    puts query_params
    @query = Person::Query.new(query_params)
    @people = @query.results

    @pagy, @people = pagy(@people.order(:lastname, :addressee), limit: 4, size: 7)
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person), notice: "Person was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to @person, notice: "Person was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy!

    redirect_to people_path, status: :see_other, notice: "Person was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.expect(person: [ :addressee, :lastname, :street, :city, :state, :zip, :note ])
    end

    def query_params
      params.fetch(:query, {}).permit(:addressee_contains, :lastname_starts_with, :city_contains, :state_is, :zip_is)
    end
end
