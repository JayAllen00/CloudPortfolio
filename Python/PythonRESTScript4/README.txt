Download pip files

pip install fastapi
pip install uvicorn

run app

uvicorn books:app --reload

URL

127.0.0.1:8000/docs

Purpose of Code

The purpose of this Python code is to show a RESTful architecture, 
how clients send requests to a server to retrieve or modify resources, 
and then servers send clients responses to their requests. 
This code uses the HTTP method (Get, Post, Put, Delete) 
to show responses like a 200 response as success and 400 response as client error. 

Get - Read existing resources 
Post - creates a new resource
Put - updates/edits resources
Delete - deletes resources

GitHub Link

https://github.com/JayAllen00/CloudPortfolio/blob/master/Python/PythonRESTScript4/movies.py