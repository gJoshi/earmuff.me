package com.earmuffme.integrations

import grails.transaction.Transactional

import com.moviejukebox.thetvdb.TheTVDB
import com.moviejukebox.thetvdb.model.Episode
import com.moviejukebox.thetvdb.model.Series

import groovyx.net.http.RESTClient

@Transactional
class TheTvDbApiService {

    /**
     * Src Code : https://github.com/Omertron/api-thetvdb
     */

    def apiKey = System.env.THETVDB_APIKEY
    static final String LANG = "en" //Default

    TheTVDB theTvDb = new TheTVDB(apiKey)

    def getTvUpdates(int daysback, String lang = LANG) {
        StringBuilder urlBuilder = new StringBuilder(TheTVDB.getXmlMirror(apiKey))
        urlBuilder.append("Updates.php?type=all&time=")
        urlBuilder.append((Calendar.getInstance().getTimeInMillis() / 1000) - (daysback * 3600 * 24))

        RESTClient rest = new RESTClient(urlBuilder.toString())

        def resp = rest.get(contentType : TEXT, headers : [Accept : 'application/xml'])

        def rootNode = new XmlSlurper().parseText(resp.data.text)

        def series = []
        def episodes = []
        def timestamp = 0

        rootNode.children()*.each {
            if (it.name() == "Series") {
                series.add(it.text())
            } else if (it.name() == "Episode") {
                episodes.add(it.text())
            } else if (it.name() == "Time") {
                timestamp = it.text()
            }
        }

        return [timestamp: timestamp, series: series, episodes: episodes]
    }

    def getTvSeries(String seriesId, String lang = LANG) {
        Series s = theTvDb.getSeries(seriesId, lang);
    }

    def getTvEpisode(String episodeId, String lang = LANG) {
        Episode e = theTvDb.getEpisodeById(episodeId, lang)
    }
}
