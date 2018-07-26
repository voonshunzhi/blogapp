module ArticlesHelper
    def persisted_comments(comments)
        comments.reject { |c| c.new_record? }
    end
end
