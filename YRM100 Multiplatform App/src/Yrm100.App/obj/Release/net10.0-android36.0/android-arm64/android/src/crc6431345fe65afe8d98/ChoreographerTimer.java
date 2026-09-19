package crc6431345fe65afe8d98;


public class ChoreographerTimer
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.view.Choreographer.FrameCallback
{

	public ChoreographerTimer ()
	{
		super ();
		if (getClass () == ChoreographerTimer.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.ChoreographerTimer, Avalonia.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public void doFrame (long p0)
	{
		n_doFrame (p0);
	}

	private native void n_doFrame (long p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
