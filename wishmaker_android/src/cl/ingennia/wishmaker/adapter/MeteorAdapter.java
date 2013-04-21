package cl.ingennia.wishmaker.adapter;

import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import cl.ingennia.wishmaker.domain.Meteor;

import com.googlecode.androidannotations.annotations.EBean;
import com.googlecode.androidannotations.annotations.RootContext;

@EBean
public class MeteorAdapter extends BaseAdapter {
	List<Meteor> meteors = new ArrayList<Meteor>();

	@RootContext
	Context context;
	
	public void clear(){
		meteors = new ArrayList<Meteor>();
		notifyDataSetChanged();
	}
	public void add(Meteor mu){
		meteors.add(mu);
		notifyDataSetChanged();
	}

	@Override
	public int getCount() {
		return meteors.size();
	}

	@Override
	public Meteor getItem(int position) {
		return meteors.get(position);
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) { 
		MeteorItemView personItemView;
		if (convertView == null) {
			personItemView = MeteorItemView_.build(context);
		} else {
			personItemView = (MeteorItemView_) convertView;
		}

		personItemView.bind(getItem(position));
		return personItemView;
	}

}
