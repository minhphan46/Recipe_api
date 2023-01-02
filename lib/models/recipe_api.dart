import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:recipe_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
/* const unirest = require("unirest");

const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

req.query({
	"limit": "24",
	"start": "0"
});

req.headers({
	"X-RapidAPI-Key": "1af9e36c00msh99f525155f26263p1c4d8bjsnaecf024205ff",
	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
	"useQueryString": true
});

req.end(function (res) {
	if (res.error) throw new Error(res.error);

	console.log(res.body);
}); */
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "24", "start": "0"});
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "1af9e36c00msh99f525155f26263p1c4d8bjsnaecf024205ff",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);

    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}
