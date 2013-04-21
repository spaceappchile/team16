package cl.ingennia.wishmaker.adapter;

import android.content.Context;
import android.widget.LinearLayout;
import android.widget.TextView;
import cl.ingennia.wishmaker.R;
import cl.ingennia.wishmaker.domain.Meteor;

import com.googlecode.androidannotations.annotations.EViewGroup;
import com.googlecode.androidannotations.annotations.ViewById;

@EViewGroup(R.layout.item_meteor)
public class MeteorItemView extends LinearLayout {

	@ViewById
	TextView title;

	public MeteorItemView(Context context) {
		super(context);
	}

	public void bind(Meteor meteor) {
		title.setText(meteor.getTitle());
	}

}
