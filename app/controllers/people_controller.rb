class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people
  def index
    @pagy, @people = pagy(Person.all)
  end

  # GET /people/1 or /people/1.json
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
    normalized_parms = normalize(person_params)
    @person = Person.new(normalized_parms)

    if @person.save
      redirect_to people_path, notice: "Person was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    normalized_parms = normalize(person_params)

    if @person.update(normalized_parms)
      redirect_to @person, notice: "Person was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy!

    redirect_to people_path, status: :see_other, notice: "Person was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.expect(person: [ :addressee, :street, :city, :state, :zip, :note ])
    end

    def normalize(parms)
      inter1 = parms["state"].upcase if parms["state"]
      inter2 = inter1.strip if inter1
      parms["state"] = inter2
      parms
    end
end
