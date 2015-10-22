module VisitorCommentable
	extend ActiveSupport::Concern

	def build_visitor_comment
    if session[:visitor_attr] && session[:comments_attr]
      Visitor.build_comment(session[:visitor_attr], session[:comments_attr])
    else
      Visitor.build_empty_comment
    end
  end

  def delete_sessions keys
    keys.each{|k| session.delete(k) if session[k]}
  end
end