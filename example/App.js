/**
 * Sample React Native App
 *
 * adapted from App.js generated by the following command:
 *
 * react-native init example
 *
 * https://github.com/facebook/react-native
 */

import React, {useState, useEffect} from 'react';
import {Button, Text, View, FlatList} from 'react-native';
import PointSdkRn from 'react-native-point-sdk';
import styled from 'styled-components/native';
import {NavigationContainer} from '@react-navigation/native';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';

function HomeScreen() {
  const [user, setUser] = useState(null);

  const handleRequestPermissions = async () => {
    try {
      const result = await PointSdkRn.requestPermissions();
      console.log(result);
    } catch (error) {
      console.log(error);
    }
  };

  const handleLogin = async () => {
    try {
      await PointSdkRn.login(
        'eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIiwiaXNzIjoiaHR0cHM6Ly9wb2ludC1hcHAtZGV2LnVzLmF1dGgwLmNvbS8ifQ..7k85_xoymzp4TdU3.947hcoZJX1wVAsHoQlolM97qGz3uFCfYyJBSkXi8jp1gQ0t-qSgC0YrMArs9K-AwbarM3T84K3bLaBsi-HY4MBtQK7brG2ac-g6HsI85M38PXpTCQfqHYLTsFdglWUJSjVyir8SI9sTMTJMrS1Kdi-b-s6sNwAz8yaJzfsXCZ0WXILF2fA9AFFlKotudi_M7a95FpPosJMjuHz2wYpLHBC1OHWZI2dIgjg85ptASe7IGKJRQF-0zj1txNnHdl6EU2Uh_6wdjHaPBAyNFM8yJulfEiTG_vcWPmpubgpDueOdOSqXWHO04uWpPG-gMDNvjfVFr-pvTj8ZAtg-tCX_tCueYODwi5FNdyI8XlhFMiftPngg6.sTguS1fmttU2AryKbk5oOw',
      );
      const userData = await PointSdkRn.getUserData();
      setUser(userData);
      console.log('Successfully logged in');
    } catch (error) {
      console.log(error);
    }
  };

  const handleLogout = async () => {
    try {
      await PointSdkRn.logout();
      setUser(null);
      console.log('Successfully logged out');
    } catch (error) {
      console.log(error);
    }
  };

  const handleStartBackgroundListener = async () => {
    try {
      const result = await PointSdkRn.startBackgroundListener();
      console.log(result);
    } catch (error) {
      console.log(error);
    }
  };

  const handleStopBackgroundListener = async () => {
    try {
      const result = await PointSdkRn.stopBackgroundListener();
      console.log(result);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
      {user && (
        <Text style={{fontSize: 18, fontWeight: 'bold'}}>
          Welcome, {user.email}!
        </Text>
      )}
      <Button onPress={handleRequestPermissions} title="Request Permissions" />
      <Button onPress={handleLogin} title="Login" />
      <Button onPress={handleLogout} title="Logout" />
      <Button
        onPress={handleStartBackgroundListener}
        title="Start Background Listener"
      />
      <Button
        onPress={handleStopBackgroundListener}
        title="Stop Background Listener"
      />
    </View>
  );
}

function WorkoutsScreen() {
  const [workouts, setWorkouts] = useState([]);

  async function getWorkouts() {
    setWorkouts([]);
    setWorkouts(await PointSdkRn.getUserWorkouts(0));
  }

  return (
    <View>
      <Button onPress={getWorkouts} title="Get Workouts" />
      <FlatList
        data={workouts}
        renderItem={({item}) => (
          <WorkoutItem>
            <Text>ID: {item.id}</Text>
            <Text>Calories: {item.calories}</Text>
            <Text>Duration: {item.duration}</Text>
            <Text>Start: {item.start}</Text>
            <Text>End: {item.end}</Text>
          </WorkoutItem>
        )}
      />
    </View>
  );
}

const Tab = createBottomTabNavigator();

const App = () => {
  useEffect(() => {
    PointSdkRn.setup('foo', 'bar', PointSdkRn.healthPermissions, (_, success) =>
      console.log(success),
    );
  }, []);

  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="Home" component={HomeScreen} />
        <Tab.Screen name="Workouts" component={WorkoutsScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};

const WorkoutItem = styled.View`
  border-bottom-width: 1px;
  border-bottom-color: #ccc;
  padding: 10px;
`;

export default App;
