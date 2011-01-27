class HerosController < ApplicationController
  # GET /heros
  # GET /heros.xml
  def index
    @heros = Hero.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heros }
    end
  end

  # GET /heros/1
  # GET /heros/1.xml
  def show
    @hero = Hero.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hero }
    end
  end

  # GET /heros/new
  # GET /heros/new.xml
  def new
    @hero = Hero.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hero }
    end
  end

  # GET /heros/1/edit
  def edit
    @hero = Hero.find(params[:id])
  end

  # POST /heros
  # POST /heros.xml
  def create
    @hero = Hero.new(params[:hero])

    respond_to do |format|
      if @hero.save
        format.html { redirect_to(@hero, :notice => 'Hero was successfully created.') }
        format.xml  { render :xml => @hero, :status => :created, :location => @hero }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hero.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heros/1
  # PUT /heros/1.xml
  def update
    @hero = Hero.find(params[:id])

    respond_to do |format|
      if @hero.update_attributes(params[:hero])
        format.html { redirect_to(@hero, :notice => 'Hero was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hero.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heros/1
  # DELETE /heros/1.xml
  def destroy
    @hero = Hero.find(params[:id])
    @hero.destroy

    respond_to do |format|
      format.html { redirect_to(heros_url) }
      format.xml  { head :ok }
    end
  end
end
