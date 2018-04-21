# Exercise 1: reading and querying a web API

# Load the httr and jsonlite libraries for accessing data
# You can also load `dplyr` if you wish to use it
library(httr)
library(jsonlite)
library(dplyr)

# Create a variable for the API's base URI (https://api.github.com)
uri_base <- "https://api.github.com/"

# Under the "Repositories" category of the API, 
# find the endpoint that will list repos in an organization. Then, 
# Create a variable `resource` that stores the endpoint for the "info201"
# organization repos (this is the PATH to the resource of interest).
# (FYI: this is where we keep the book code and master exercise sets!)
organization <- "info201"
resource <- paste0("orgs/", organization, "/repos")
uri_full <- paste0(uri_base, resource)

# Send a GET request to this endpoint (the `base_uri`` followed by `resource`)
response <- GET(uri_full)

# Extract the "text" of the response usin the `content` function
response_text <- content(response, type = "text")

# Convert the body from JSON into a data frame
body_content <- fromJSON(response_text)

# How many (public) repositories does the organization have?
public_repos <- nrow(body_content)

##### New query ######

# Use a "Search" endpoint to search for repositories about "graphics"
# (bonus: limit language to only "R" -- which requires a different syntax)
# (hint: https://developer.github.com/v3/search/#search-repositories)
# Reassign the `resource` variable to refer to the appropriate resource.
resource <- paste0("search/repositories?")

# You will need to specify some query parameters. Create a `query_params` list 
# variable that specifies an appropriate key and value for the search term and
# the language
search_param <- "q=graphics"
uri_full <- paste0(uri_base, resource, search_param)

# Send a GET request to this endpoint--including your params list as the `query`
search_response <- GET(paste0(uri_full))

# Extract the response body and convert it from JSON.
search_text <- content(search_response, type = "text")
search_content <- fromJSON(search_text)

# How many search repos did your search find? (Hint: check the list names)


# What are the full names of the top 5 results?

