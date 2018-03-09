package com.example.rabobank.myassignment.ui;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.rabobank.myassignment.R;

import java.util.ArrayList;
import java.util.List;

public class ItemArrayAdapter extends ArrayAdapter<String[]> {
    private List<String[]> cvsList = new ArrayList();

    static class ItemViewHolder {
        TextView name;
        TextView details;
    }

    public ItemArrayAdapter(Context context, int textViewResourceId) {
        super(context, textViewResourceId);
    }

    @Override
    public void add(String[] object) {
        cvsList.add(object);
        super.add(object);
    }

    @Override
    public int getCount() {
        return this.cvsList.size();
    }

    @Override
    public String[] getItem(int index) {
        return this.cvsList.get(index);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        ItemViewHolder viewHolder;
        if (row == null) {
            LayoutInflater inflater = (LayoutInflater) this.getContext().
                    getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            row = inflater.inflate(R.layout.item_layout, parent, false);
            viewHolder = new ItemViewHolder();
            viewHolder.name = row.findViewById(R.id.name);
            viewHolder.details = row.findViewById(R.id.details);
            row.setTag(viewHolder);
        } else {
            viewHolder = (ItemViewHolder) row.getTag();
        }
        String[] stat = getItem(position);
        viewHolder.name.setText(stat[0] + " " + stat[1]);
        viewHolder.details.setText(stat[2] + " " + stat[3]);
        return row;
    }
}
