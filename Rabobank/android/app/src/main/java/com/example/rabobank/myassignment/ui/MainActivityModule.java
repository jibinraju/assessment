package com.example.rabobank.myassignment.ui;

import android.app.Application;

import com.example.rabobank.myassignment.R;
import com.example.rabobank.myassignment.data.CvsServices;

import java.io.InputStream;

import dagger.Binds;
import dagger.Module;
import dagger.Provides;

/**
 * Created by jibinraju on 09/03/2018.
 */

@Module
public abstract class MainActivityModule {

    @Provides
    static MainPresenter provideMainPresenter(MainView mainView, CvsServices cvsServices) {
        return new MainPresenterImpl(mainView, cvsServices);
    }

    @Provides
    static InputStream getCvsInputStream(Application application){
        return application.getResources().openRawResource(R.raw.issues);
    }

    @Provides
    static ItemArrayAdapter getArrayAdapter(Application application){
        return new ItemArrayAdapter(application, R.layout.item_layout);
    }

    @Binds
    abstract MainView provideMainView(MainActivity mainActivity);

}
