package com.example.rabobank.myassignment.data;

import android.util.Log;

import com.example.rabobank.myassignment.ui.MainObservable;
import com.example.rabobank.myassignment.ui.MainPresenter;
import com.example.rabobank.myassignment.ui.MainPresenterImpl;
import com.example.rabobank.myassignment.ui.MainView;

import java.util.List;

import javax.inject.Inject;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.schedulers.Schedulers;


/**
 * Created by jibinraju on 09/03/2018.
 */

public class CvsServices {

    private static final String TAG = "CvsServices";
    private final CompositeDisposable disposables = new CompositeDisposable();

    @Inject
    MainObservable mainObservable;

    @Inject
    public CvsServices( ) {

    }

    public void loadData(final MainPresenterImpl mainPresenter) {
        disposables.add(mainObservable.sampleObservable()
                // Run on a background thread
                .subscribeOn(Schedulers.io())
                // Be notified on the main thread
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new DisposableObserver<List>() {
                    @Override public void onComplete() {
                        Log.d(TAG, "onComplete()");
                    }

                    @Override public void onError(Throwable e) {
                        Log.e(TAG, "onError()", e);
                    }

                    @Override public void onNext(List data) {
                        mainPresenter.loadCvsData(data);
                    }
                }));
    }
}
