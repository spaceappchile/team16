package cl.ingennia.wishmaker.fragment;

import android.widget.TextView;
import cl.ingennia.wishmaker.R;
import cl.ingennia.wishmaker.domain.Meteor;

import com.actionbarsherlock.app.SherlockFragment;
import com.googlecode.androidannotations.annotations.AfterViews;
import com.googlecode.androidannotations.annotations.EFragment;
import com.googlecode.androidannotations.annotations.FragmentArg;
import com.googlecode.androidannotations.annotations.ViewById;

@EFragment(R.layout.fragment_meteor_description)
public class MeteorDescriptionFragment extends SherlockFragment {
	
	@ViewById
	TextView title, subtitle, hashtag, address;
	
	@FragmentArg("meteor")
	Meteor meteorObject;
	
	@AfterViews
	public void hidrateLayout(){
		
	}

}
