import React, {useState} from 'react';
import {Text, TouchableOpacity, View, DeviceEventEmitter} from 'react-native';
import RTNMyPicker from 'rtn-my-picker/js/NativeMyPicker';
import RTNMyImage from 'rtn-my-image/js/RTNMyImageNativeComponent';

const AndroidView = () => {
  const [imageUri, setImageUri] = useState('');

  React.useEffect(() => {
    DeviceEventEmitter.addListener('result', message => {
      setImageUri(message);
    });

    return () => {
      DeviceEventEmitter.removeAllListeners();
    };
  }, []);

  return (
    <View>
      <TouchableOpacity
        onPress={() => {
          RTNMyPicker?.pickImage();
        }}>
        <Text>Capture Photo</Text>
      </TouchableOpacity>
      {imageUri !== '' && (
        <RTNMyImage imageUrl={imageUri} style={{width: 100, height: 100}} />
      )}
    </View>
  );
};

export default AndroidView;
