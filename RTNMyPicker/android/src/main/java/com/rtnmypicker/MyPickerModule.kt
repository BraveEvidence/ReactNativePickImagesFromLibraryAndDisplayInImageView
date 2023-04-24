package com.rtnmypicker

import android.Manifest
import android.os.Build
import androidx.core.app.ActivityCompat
import com.facebook.react.bridge.ReactApplicationContext


class MyPickerModule(val context: ReactApplicationContext?): NativeMyPickerSpec(context) {

    private val REQUEST_CODE_PERMISSIONS = 10
    private val REQUIRED_PERMISSIONS = mutableListOf(Manifest.permission.READ_EXTERNAL_STORAGE).toTypedArray()

    override fun getName(): String {
        return NAME
    }

    override fun pickImage() {
        ActivityCompat.requestPermissions(
            context?.currentActivity!!,
            REQUIRED_PERMISSIONS,
            REQUEST_CODE_PERMISSIONS
        )
    }


    companion object {
        const val NAME = "RTNMyPicker"
    }







}