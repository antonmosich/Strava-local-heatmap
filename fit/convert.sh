for file in *.fit; do
	gpsbabel -i garmin_fit -f "${file}" -x transform,wpt=trk,del -x radius,distance=10K,lat=48.21,lon=16.36 -x transform,trk=wpt,del -o gpx -F "../gpx/${file}.gpx"
done
