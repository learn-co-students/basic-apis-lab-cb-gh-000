class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "b6014ca628dc3b2092e0"
    secret = "836e87f1651c7416ca1a873ac67eae1c7ea38e2d"

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|

      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    @body = JSON.parse(@resp.body)
    @results = @body["items"]
    render :search
    
  end
end
