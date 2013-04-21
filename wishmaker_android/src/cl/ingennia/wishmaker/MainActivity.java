package cl.ingennia.wishmaker;

import android.support.v4.app.Fragment;
import cl.ingennia.wishmaker.fragment.MeteorsFragment_;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.googlecode.androidannotations.annotations.AfterViews;
import com.googlecode.androidannotations.annotations.EActivity;

@EActivity(R.layout.activity_main)
public class MainActivity extends SherlockFragmentActivity {

	@AfterViews
	public void setLayout() {
		Fragment MeteorsFragment_ = new MeteorsFragment_();
		getSupportFragmentManager().beginTransaction()
				.add(R.id.meteors, MeteorsFragment_).commit();
	}
}
