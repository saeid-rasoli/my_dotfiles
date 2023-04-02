#!/usr/bin/env sh

qdbus org.qstardict.dbus /qstardict org.freedesktop.DBus.Properties.Set \
       org.qstardict.dbus mainWindowVisible \
       $(( ! $(qdbus org.qstardict.dbus /qstardict \
       org.freedesktop.DBus.Properties.Get org.qstardict.dbus mainWindowVisible)))
