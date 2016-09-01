require "httparty"


#POSITIVE TESTING

#Create
def pos_create
	@r = HTTParty.post "http://lacedeamon.spartaglobal.com/todos", query: {title: "Positive Create Test!", due: "2016-09-01"}
	@id = @r["id"]
end

#Read
def pos_read
	@r = HTTParty.get "http://lacedeamon.spartaglobal.com/todos/#{@id}"
end

#Update
def pos_update
	@r = HTTParty.patch "http://lacedeamon.spartaglobal.com/todos/#{@id}", query: {title: "Positive Update Test!"}
end

#Delete
def pos_delete
	@r = HTTParty.delete "http://lacedeamon.spartaglobal.com/todos/#{@id}"
end


#NEGATIVE TESTING

#Create
def neg_create
	@r = HTTParty.post "http://lacedeamon.spartaglobal.com/todos", query: {title: "", due: "2016-09-01"}
	@id = @r["id"]
end

#Read
def neg_read
	@r = HTTParty.get "http://lacedeamon.spartaglobal.com/todos/afsnjk"
end

#Update
def neg_update
	@r = HTTParty.patch "http://lacedeamon.spartaglobal.com/todos/#{@id}", query: {something: "Negative Update Test!"}
end

#Delete
def neg_delete
	@r = HTTParty.delete "http://lacedeamon.spartaglobal.com/todos"
end