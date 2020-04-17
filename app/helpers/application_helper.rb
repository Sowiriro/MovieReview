module ApplicationHelper

    def page_title 
        title = "M.R"
        title = @page_title + " - " + title if @page_title 
        title
    end
end
