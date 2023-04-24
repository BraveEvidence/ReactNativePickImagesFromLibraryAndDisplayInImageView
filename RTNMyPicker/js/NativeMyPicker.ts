import type {TurboModule} from 'react-native/Libraries/TurboModule/RCTExport';
import {TurboModuleRegistry} from 'react-native';

export interface Spec extends TurboModule {
  pickImage(): void;
}

export default TurboModuleRegistry.get<Spec>('RTNMyPicker') as Spec | null;
