import React, {useEffect} from 'react';
import {AppState, AppStateStatus} from 'react-native';
import PointSdkRn from 'react-native-point-sdk';
import {NavigationContainer} from '@react-navigation/native';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';

import {HomeScreen} from './screens/Home';
import {WorkoutsScreen} from './screens/Workouts';
import {RecommendationsScreen} from './screens/Recommendations';

const Tab = createBottomTabNavigator();

const App = () => {
  useEffect(() => {
    PointSdkRn.setup(
      'foo',
      'bar',
      PointSdkRn.healthPermissions,
      'development',
      console.log,
    );

    PointSdkRn.setupBackgroundListeners();
    PointSdkRn.enableBackgroundListeners();

    const appStateSubscription = AppState.addEventListener(
      'change',
      (state: AppStateStatus) => {
        if (state === 'active') {
          PointSdkRn.enableForegroundListeners();
        } else {
          PointSdkRn.disableForegroundListeners();
        }
      },
    );

    return appStateSubscription?.remove;
  }, []);

  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="Home" component={HomeScreen} />
        <Tab.Screen name="Workouts" component={WorkoutsScreen} />
        <Tab.Screen name="Recommendations" component={RecommendationsScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};

export default App;