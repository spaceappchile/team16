//
// DO NOT EDIT THIS FILE, IT HAS BEEN GENERATED USING AndroidAnnotations.
//


package cl.ingennia.wishmaker.fragment;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import cl.ingennia.wishmaker.R.layout;
import cl.ingennia.wishmaker.domain.Meteor;

public final class MeteorDescriptionFragment_
    extends MeteorDescriptionFragment
{

    private View contentView_;

    private void init_(Bundle savedInstanceState) {
        injectFragmentArguments_();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        init_(savedInstanceState);
        super.onCreate(savedInstanceState);
    }

    private void afterSetContentView_() {
        address = ((TextView) findViewById(cl.ingennia.wishmaker.R.id.address));
        hashtag = ((TextView) findViewById(cl.ingennia.wishmaker.R.id.hashtag));
        title = ((TextView) findViewById(cl.ingennia.wishmaker.R.id.title));
        subtitle = ((TextView) findViewById(cl.ingennia.wishmaker.R.id.subtitle));
        hidrateLayout();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        contentView_ = super.onCreateView(inflater, container, savedInstanceState);
        if (contentView_ == null) {
            contentView_ = inflater.inflate(layout.fragment_meteor_description, container, false);
        }
        afterSetContentView_();
        return contentView_;
    }

    public View findViewById(int id) {
        if (contentView_ == null) {
            return null;
        }
        return contentView_.findViewById(id);
    }

    public static MeteorDescriptionFragment_.FragmentBuilder_ builder() {
        return new MeteorDescriptionFragment_.FragmentBuilder_();
    }

    private void injectFragmentArguments_() {
        Bundle args_ = getArguments();
        if (args_!= null) {
            if (args_.containsKey("meteor")) {
                try {
                    meteorObject = ((Meteor) args_.getSerializable("meteor"));
                } catch (ClassCastException e) {
                    Log.e("MeteorDescriptionFragment_", "Could not cast argument to the expected type, the field is left to its default value", e);
                }
            }
        }
    }

    public static class FragmentBuilder_ {

        private Bundle args_;

        private FragmentBuilder_() {
            args_ = new Bundle();
        }

        public MeteorDescriptionFragment build() {
            MeteorDescriptionFragment_ fragment_ = new MeteorDescriptionFragment_();
            fragment_.setArguments(args_);
            return fragment_;
        }

        public MeteorDescriptionFragment_.FragmentBuilder_ meteorObject(Meteor meteorObject) {
            args_.putSerializable("meteor", meteorObject);
            return this;
        }

    }

}