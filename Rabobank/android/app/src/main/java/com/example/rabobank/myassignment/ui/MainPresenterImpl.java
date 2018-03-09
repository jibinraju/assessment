package com.example.rabobank.myassignment.ui;

import com.example.rabobank.myassignment.data.CvsServices;

import java.util.List;

/**
 * Created by jibinraju on 09/03/2018.
 */

public class MainPresenterImpl implements MainPresenter {

    CvsServices cvsServices;
    MainView mainView;



    @Override
    public void loadMain() {

        cvsServices.loadData(this);
    }

    @Override
    public void loadCvsData(List data) {
       mainView.onMainLoaded(data);
    }

    @Override
    public void showDataList(ItemArrayAdapter itemArrayAdapter, List<String[]> data) {

        for(String[] scoreData : data ) {
            itemArrayAdapter.add(scoreData);
        }

    }

    public MainPresenterImpl(MainView mainView, CvsServices cvsServices) {

        this.mainView=mainView;
        this.cvsServices=cvsServices;

    }
}
