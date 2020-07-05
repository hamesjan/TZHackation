import os
import pymongo
import json

from amadeus import Client, ResponseError
from amadeus import Location


def getSafety(destlat, destlong):


    response = amadeus.safety.safety_rated_locations.get(latitude=destlat, longitude=destlong)
    # print (response.data)
    return response.data

def getPOI(destlat, destlong):
    amadeus = Client(
    client_id='NOTHINGTOSEEHERE',
    client_secret='THANKYOUTRYAGAIN')
    response = amadeus.reference_data.locations.points_of_interest.get(latitude=destlat, longitude=destlong)
    # print(response.data)

    return response.data





def dummy(request):
    """Responds to any HTTP request.
    Args:
        request (flask.Request): HTTP request object.
    Returns:
        The response text or any set of values that can be turned into a
        Response object using
        `make_response <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>`.
    """
    if request.method == 'OPTIONS':
        # Allows GET requests from origin https://mydomain.com with
        # Authorization header
        headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'POST',
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Max-Age': '3600',
            'Access-Control-Allow-Credentials': 'true'
        }
        return ('', 204, headers)

    # Set CORS headers for main requests
    headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true'
    }

    request_json = request.get_json()
    if 'lat' not in request_json:
        return "no latitude"
    if 'lon' not in request_json:
        return "no longitude"
        
    lat = request_json['lat']
    lon = request_json['lon']

    data2 = getPOI(lat,lon)
    
    retjson = {}
    if len(data2) != 0:

        POIs = []
        for loc in data2:
            poi = {}
            poi['name'] = loc['name']
            poi['lat'] = loc["geoCode"]["latitude"]
            poi['lon'] = loc["geoCode"]["longitude"]
            poi['category'] = loc["category"]
            POIs.append(poi)
        
        retjson['POIs'] = POIs
        retjson['found'] = True
    else:
        retjson['POIs'] = []
        retjson['found'] = False
    


    
    return json.dumps(retjson)


    retstr = "action not done"

    if request.args and 'message' in request.args:
        return request.args.get('message')
    elif request_json and 'message' in request_json:
        return request_json['message']
    else:
        return retstr
