class ApiDocController < ApplicationController

	def index
		@routes = []
		Rails.application.routes.routes.map do |route|
			verb = route.verb.to_s + " - "
			next if verb == " - " or verb.match(/PATCH/)

			link = request.original_url.split(/\/api/).first + route.path.spec.to_s.gsub(/\(\.\:format\)|\.\:format/, "")
			@routes << verb + "<a href='#{link}'>#{link}</a>" if !link.match(/rails|api_doc|\*/)
		end

		render :html => @routes.join("<br />").html_safe
	end
end
