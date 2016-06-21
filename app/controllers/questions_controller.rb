class QuestionsController < ApplicationController
    before_filter :authenticate_user!, only: [:create]
    def index
    	@questions = Question.all
    end

    def create
        puts "\n"*10
        puts params[:question]
        puts "\n"*10
    	Question.create params[:question].permit!
    	redirect_to action: "index"
    end
end
