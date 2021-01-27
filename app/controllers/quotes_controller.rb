class QuotesController < ApplicationController
    
    def index
        @quotes = Quote.all
        render json: @quotes
    end

    def scrape
        url = 'http://quotes.toscrape.com/'
        response = QuotesSpider.process(url)
    rescue StandardError => e
        
    end

    def search
        scrape
        @quotes = Quote.where(:tags.in =>[params[:tags]])
        render json: @quotes
    end

    def create
        @quote = Quote.new(quote_params)
        
        if @quote.save
            render json: @quote, status: :created
        else
            render json: @quote.errors, status: :unprocessable_entity
        end
    end

    def update 
        if @quote.update(quote_params)
            render json: @quote, status: :ok
        else
            render json: @quote.errors, status: unprocessable_entity
        end
    end

    private
    def quote_params
        params.require(:quote).permit(:quote, :author, :author_about, :tags)
    end
end