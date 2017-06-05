class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      case Item.find(search_term)
      when nil
        resp.status = 400
        resp.write "Item not found"
      else
        cost = Item.find(search_term)
        resp.write cost
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
