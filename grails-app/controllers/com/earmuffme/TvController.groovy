package com.earmuffme

class TvController {

    def theTvDbApiService

    def index() { }

    def show(Long id) {
        [series: theTvDbApiService.getTvSeries("$id")]
    }
}
