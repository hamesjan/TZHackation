import os
import pymongo
import json

from amadeus import Client, ResponseError
from amadeus import Location


def getSafety(destlat, destlong):
    amadeus = Client(
    client_id='NOTHINGTOSEEHERE',
    client_secret='GETYOUROWNDAMNKEY')

    response = amadeus.safety.safety_rated_locations.get(latitude=destlat, longitude=destlong)
    # print (response.data)
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

    data2 = getSafety(lat,lon)
    
    retjson = {}
    if len(data2) != 0:
        safetyscore = data2[0]["safetyScores"]["overall"]

        retjson['women'] = data2[0]["safetyScores"]["women"]
        retjson['physical'] = data2[0]["safetyScores"]["physicalHarm"]
        retjson['theft'] = data2[0]["safetyScores"]["theft"]
        retjson['political'] = data2[0]["safetyScores"]["politicalFreedom"]
        retjson['lgbtq'] = data2[0]["safetyScores"]["lgbtq"]
        retjson['medical'] = data2[0]["safetyScores"]["medical"]
        retjson['overall'] = 100 - safetyscore
        retjson['found'] = True
    else:
        retjson['women'] = 20
        retjson['physical'] = 20
        retjson['theft'] = 20
        retjson['political'] = 20
        retjson['lgbtq'] = 20
        retjson['medical'] = 20
        retjson['overall'] = 20
        retjson['found'] = False
    
    
    return json.dumps(retjson)


    retstr = "action not done"

    if request.args and 'message' in request.args:
        return request.args.get('message')
    elif request_json and 'message' in request_json:
        return request_json['message']
    else:
        return retstr
