package com.example.rabobank.myassignment.ui;

import com.example.rabobank.myassignment.data.CSVFile;

import java.util.List;
import java.util.concurrent.Callable;

import javax.inject.Inject;

import io.reactivex.Observable;

/**
 * Created by jibinraju on 09/03/2018.
 */

public class MainObservable {

    @Inject
    CSVFile csvFile;

    @Inject
    public MainObservable() {
    }

    public Observable<List> sampleObservable() {
        return Observable.defer(new Callable<Observable<List>>() {
            @Override
            public Observable<List> call() throws Exception {
                List data = csvFile.read();
                return Observable.just(data);
            }
        });
    }
}
