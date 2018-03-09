package com.example.rabobank.myassignment.ui;

import android.os.Bundle;
import android.os.Parcelable;
import android.widget.Button;
import android.widget.ListView;

import com.example.rabobank.myassignment.R;
import com.example.rabobank.myassignment.data.CSVFile;

import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import butterknife.Unbinder;
import dagger.android.support.DaggerAppCompatActivity;

public class MainActivity extends DaggerAppCompatActivity implements MainView {


    @Inject
    MainPresenter mainPresenter;

    @BindView(R.id.btnload)
    Button loadBtn;

    Unbinder unbind;

    @BindView(R.id.listView)
    ListView listView;

    @Inject
    ItemArrayAdapter itemArrayAdapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        unbind = ButterKnife.bind(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unbind.unbind();
    }

    @OnClick(R.id.btnload)
    public void loadFile() {
        mainPresenter.loadMain();
    }

    @Override
    public void onMainLoaded(List<String[]> data) {

        Parcelable state = listView.onSaveInstanceState();
        listView.setAdapter(itemArrayAdapter);
        listView.onRestoreInstanceState(state);
        mainPresenter.showDataList(itemArrayAdapter,data);

    }
}
