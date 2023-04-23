class Public::HomesController < ApplicationController

    def top
    @articles = Article.all.order(created_at: :desc)
    end
    
    def anout
    end
end
