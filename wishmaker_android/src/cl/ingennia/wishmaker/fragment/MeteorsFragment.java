package cl.ingennia.wishmaker.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ListView;
import cl.ingennia.wishmaker.MeteorActivity_;
import cl.ingennia.wishmaker.adapter.MeteorAdapter;
import cl.ingennia.wishmaker.domain.Meteor;
import cl.ingennia.wishmaker.rest.RestClient;

import com.actionbarsherlock.app.SherlockListFragment;
import com.googlecode.androidannotations.annotations.AfterViews;
import com.googlecode.androidannotations.annotations.Background;
import com.googlecode.androidannotations.annotations.Bean;
import com.googlecode.androidannotations.annotations.EFragment;
import com.googlecode.androidannotations.annotations.UiThread;
import com.googlecode.androidannotations.annotations.rest.RestService;

@EFragment
public class MeteorsFragment extends SherlockListFragment {

	@Bean
	MeteorAdapter adapter;

	@RestService
	RestClient rest;

	@AfterViews
	@Background
	public void loadAdapter() {
		Meteor[] meteors = rest.getAllMeteors();
		if (meteors != null && meteors.length >= 0) {
			Log.d("WENA", "WENA");
			startListAdapter(meteors);
		}
	}

	@UiThread
	public void startListAdapter(Meteor[] meteors) {
		adapter.clear();
		for (Meteor meteor : meteors) {

			adapter.add(meteor);
		}
		setListAdapter(adapter);
	}

	@Override
	public void onListItemClick(ListView listView, View view, int position,
			long id) {
		super.onListItemClick(listView, view, position, id);

		Meteor meteor = (Meteor) this.getListAdapter().getItem(position);
		Bundle bundle = new Bundle();
		bundle.putSerializable("meteor", meteor);

		Intent intent = new Intent(this.getActivity(), MeteorActivity_.class);
		intent.putExtras(bundle);

		startActivity(intent);

	}
}
