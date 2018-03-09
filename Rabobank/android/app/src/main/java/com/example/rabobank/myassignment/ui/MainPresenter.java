package com.example.rabobank.myassignment.ui;

import java.util.List;

/**
 * Created by jibinraju on 09/03/2018.
 */

public interface MainPresenter {
    void loadMain();

    void loadCvsData(List data);

    void showDataList(ItemArrayAdapter itemArrayAdapter, List<String[]> data);
}
