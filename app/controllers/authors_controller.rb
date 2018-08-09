class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy, :quotes]
  before_action :set_display_comments, only: [:show, :quotes]

  # GET /authors
  # GET /authors.json
  def index
    @authors, @alphaParams = Author.paginate(:page => params[:page]).alpha_paginate(params[:letter], {db_mode: true, db_field: "name",default_field:'a', js: false})
    @pageTitle = "Quotes by famous authors | QuoteEstate"
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def quotes
    @quotes = Quote.joins(:author).where( "authors.slug" => params[:author_name] ).paginate(:page => params[:page])
    @pageTitle = "Famous quotes by #{@author.name}"
  end

  def feed
    @authors = Author.all.limit(100)
    respond_to do |format|
      format.rss  { render :layout => false }
    end
  end


# select * from quotes
# left join authors
# on quotes.author_id = authors.id
# where authors.name = 'Steve Jobs'


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.friendly.find(params[:author_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name)
    end

    def set_display_comments
      @show_comments = true
    end
end
