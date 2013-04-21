package cl.ingennia.wishmaker;

import android.support.v4.app.Fragment;
import android.widget.FrameLayout;
import cl.ingennia.wishmaker.domain.Meteor;
import cl.ingennia.wishmaker.fragment.MeteorDescriptionFragment_;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.googlecode.androidannotations.annotations.AfterViews;
import com.googlecode.androidannotations.annotations.EActivity;
import com.googlecode.androidannotations.annotations.Extra;
import com.googlecode.androidannotations.annotations.ViewById;

@EActivity(R.layout.activity_meteor)
public class MeteorActivity extends SherlockFragmentActivity {
	@Extra
	Meteor meteor;
	
	@ViewById
	FrameLayout meteor_photo;
	

	@AfterViews
	public void initLayout() {
		Fragment f = MeteorDescriptionFragment_.builder().meteorObject(meteor)
				.build();
		getSupportFragmentManager().beginTransaction()
				.add(R.id.meteor_description, f).commit();
	}
}
